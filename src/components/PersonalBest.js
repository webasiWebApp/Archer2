import React, { useState } from 'react';
import axios from 'axios';

export default function PersonalBest({ archerId }) {
  const [roundId, setRoundId] = useState('');
  const [result, setResult] = useState(null);

  const fetchPersonalBest = async () => {
    try {
      const res = await axios.get(`http://localhost/archer2/routes/stats.php?action=personal-best&archerId=${archerId}&roundId=${roundId}`);
      setResult(res.data);
    } catch {
      setResult(null);
    }
  };

  return (
    <div>
      <h3>Personal Best Score</h3>
      <input type="number" placeholder="Round ID" value={roundId} onChange={e => setRoundId(e.target.value)} />
      <button onClick={fetchPersonalBest} disabled={!roundId}>Get Personal Best</button>
      {result && <p>Personal Best Score: {result.PersonalBest || 'No data'}</p>}
    </div>
  );
}
