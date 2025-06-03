import React, { useState, useEffect, useCallback } from 'react';
import axios from 'axios';

export default function ArcherScores({ archerId }) {
  const [scores, setScores] = useState([]);
  const [filters, setFilters] = useState({ from: '', to: '', roundId: '', sort: 'date' });

  const fetchScores = useCallback(async () => {
    try {
      const params = {};
      if (filters.from) params.from = filters.from;
      if (filters.to) params.to = filters.to;
      if (filters.roundId) params.roundId = filters.roundId;
      if (filters.sort) params.sort = filters.sort;

      const res = await axios.get(`http://localhost/archer2/routes/archer.php?action=scores&id=${archerId}`, { params });
      setScores(res.data);
    } catch (err) {
      console.error(err);
    }
  }, [filters, archerId]);

  useEffect(() => {
    fetchScores();
  }, [fetchScores]);

  return (
    <div>
      <h3>Your Scores</h3>
      <div>
        <label>
          From:
          <input type="date" value={filters.from} onChange={e => setFilters({ ...filters, from: e.target.value })} />
        </label>
        <label>
          To:
          <input type="date" value={filters.to} onChange={e => setFilters({ ...filters, to: e.target.value })} />
        </label>
        <label>
          Sort by:
          <select value={filters.sort} onChange={e => setFilters({ ...filters, sort: e.target.value })}>
            <option value="date">Date</option>
            <option value="score">Score</option>
          </select>
        </label>
      </div>
      <table border="1" cellPadding="5">
        <thead>
          <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Round ID</th>
            <th>Score</th>
          </tr>
        </thead>
        <tbody>
          {scores.length === 0 && <tr><td colSpan="4">No scores found</td></tr>}
          {scores.map(s => (
            <tr key={s.ScoreID}>
              <td>{s.Date}</td>
              <td>{s.Time}</td>
              <td>{s.RoundID}</td>
              <td>{s.Score}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
