import React, { useState } from 'react';
import axios from 'axios';

export default function ClubBest() {
  const [roundId, setRoundId] = useState('');
  const [result, setResult] = useState(null);

  const fetchClubBest = async () => {
    try {
      const res = await axios.get(`http://localhost/archer2/routes/stats.php?action=club-best&roundId=${roundId}`);
      setResult(res.data);
    } catch {
      setResult(null);
    }
  };

  return (
    <div>
      <h3>Club Best Score</h3>
      <input type="number" placeholder="Round ID" value={roundId} onChange={e => setRoundId(e.target.value)} />
      <button onClick={fetchClubBest} disabled={!roundId}>Get Club Best</button>
      {result && (
        <p>
          Score: {result.Score || 'N/A'}, Archer: {result.FirstName ? `${result.FirstName} ${result.LastName}` : 'N/A'}
        </p>
      )}
    </div>
  );
}
