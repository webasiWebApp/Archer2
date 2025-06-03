import React, { useState } from 'react';
import axios from 'axios';

export default function CompetitionResults() {
  const [competitionId, setCompetitionId] = useState('');
  const [results, setResults] = useState([]);

  const fetchResults = async () => {
    try {
      const res = await axios.get(`http://localhost/archer2/routes/stats.php?action=competition-results&competitionId=${competitionId}`);
      setResults(res.data);
    } catch {
      setResults([]);
    }
  };
  return (
    <div>
      <h3>Competition Results</h3>
      <input type="number" placeholder="Competition ID" value={competitionId} onChange={e => setCompetitionId(e.target.value)} />
      <button onClick={fetchResults} disabled={!competitionId}>Get Results</button>
      <table border="1" cellPadding="5">
        <thead>
          <tr><th>Archer</th><th>Date</th><th>Round</th><th>Score</th></tr>
        </thead>
        <tbody>
          {results.length === 0 && <tr><td colSpan="4">No results</td></tr>}
          {results.map((r, i) => (
            <tr key={i}>
              <td>{r.FirstName} {r.LastName}</td>
              <td>{r.Date}</td>
              <td>{r.RoundName}</td>
              <td>{r.Score}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
