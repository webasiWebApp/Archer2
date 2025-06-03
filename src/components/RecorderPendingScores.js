import React, { useState, useEffect } from 'react';
import axios from 'axios';

export default function RecorderPendingScores() {
  const [pendingScores, setPendingScores] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [approvingId, setApprovingId] = useState(null);

  const fetchPending = async () => {
    setLoading(true);
    setError('');
    try {
      const res = await axios.get('http://localhost/archer2/routes/recorder.php?action=staging-scores');
      if (Array.isArray(res.data)) {
        console.log('Fetched pending scores:', res.data); // Debug log
        setPendingScores(res.data);
      } else {
        console.error('Invalid response format:', res.data);
        setError('Invalid data format received');
      }
    } catch (err) {
      console.error('Fetch error:', err);
      setError('Failed to fetch pending scores: ' + err.message);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPending();
  }, []);

  const approveScore = async (id) => {
    if (!id) {
      setError('Invalid score ID.');
      return;
    }
    setApprovingId(id);
    setError('');
    try {
      await axios.post(`http://localhost/archer2/routes/recorder.php?action=approve-staging`, {
        id: id
      });
      await fetchPending(); // Refresh list after approval
    } catch (err) {
      console.error('Approval error:', err);
      setError('Error approving score: ' + err.message);
    } finally {
      setApprovingId(null);
    }
  };

  if (loading) return <p>Loading pending scores...</p>;
  if (error) return <p style={{ color: 'red' }}>{error}</p>;

  return (
    <div>
      <h3>Pending Staging Scores</h3>
      {pendingScores.length === 0 ? (
        <p>No pending scores found.</p>
      ) : (
        <>
          <p>Total pending scores: {pendingScores.length}</p>
          <table style={{ borderCollapse: 'collapse', width: '100%' }}>
            <thead>
              <tr>
                <th style={{ border: '1px solid black', padding: '8px' }}>Archer</th>
                <th style={{ border: '1px solid black', padding: '8px' }}>Date</th>
                <th style={{ border: '1px solid black', padding: '8px' }}>Time</th>
                <th style={{ border: '1px solid black', padding: '8px' }}>Round</th>
                <th style={{ border: '1px solid black', padding: '8px' }}>Score</th>
                <th style={{ border: '1px solid black', padding: '8px' }}>Actions</th>
              </tr>
            </thead>
            <tbody>
              {pendingScores.map(score => (
                <tr key={score.StagingID}>
                  <td style={{ border: '1px solid black', padding: '8px' }}>
                    {score.FirstName} {score.LastName}
                  </td>
                  <td style={{ border: '1px solid black', padding: '8px' }}>{score.Date}</td>
                  <td style={{ border: '1px solid black', padding: '8px' }}>{score.Time}</td>
                  <td style={{ border: '1px solid black', padding: '8px' }}>{score.RoundID}</td>
                  <td style={{ border: '1px solid black', padding: '8px' }}>{score.Score}</td>
                  <td style={{ border: '1px solid black', padding: '8px' }}>
                    <button
                      onClick={() => approveScore(score.StagingID)}
                      disabled={approvingId === score.StagingID}
                      style={{
                        padding: '4px 8px',
                        backgroundColor: approvingId === score.StagingID ? '#ccc' : '#4CAF50',
                        color: 'white',
                        border: 'none',
                        borderRadius: '4px',
                        cursor: approvingId === score.StagingID ? 'not-allowed' : 'pointer'
                      }}
                    >
                      {approvingId === score.StagingID ? 'Approving...' : 'Approve'}
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </>
      )}
    </div>
  );
}
