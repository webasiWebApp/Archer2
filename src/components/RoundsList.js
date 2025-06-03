import React, { useState, useEffect } from 'react';
import axios from 'axios';

export default function RoundsList() {
  const [rounds, setRounds] = useState([]);
  const [newRound, setNewRound] = useState({ RoundName: '', Description: '' });
  const [msg, setMsg] = useState(null);

  const fetchRounds = async () => {
    try {
      const res = await axios.get('http://localhost/archer2/routes/round.php?action=list');
      setRounds(res.data);
    } catch (err) {
      console.error(err);
    }
  };

  useEffect(() => {
    fetchRounds();
  }, []);

  const handleChange = e => setNewRound({ ...newRound, [e.target.name]: e.target.value });

  const handleSubmit = async e => {
    e.preventDefault();
    setMsg(null);
    try {
      await axios.post('http://localhost/archer2/routes/round.php?action=add', newRound);
      setMsg('Round added');
      setNewRound({ RoundName: '', Description: '' });
      fetchRounds();
    } catch {
      setMsg('Error adding round');
    }
  };

  return (
    <div>
      <h3>Rounds</h3>
      <ul>
        {rounds.map(r => (
          <li key={r.RoundID}>{r.RoundName} - {r.Description}</li>
        ))}
      </ul>

      <h4>Add New Round</h4>
      {msg && <p>{msg}</p>}
      <form onSubmit={handleSubmit}>
        <input name="RoundName" placeholder="Name" value={newRound.RoundName} onChange={handleChange} required />
        <input name="Description" placeholder="Description" value={newRound.Description} onChange={handleChange} />
        <button type="submit">Add Round</button>
      </form>
    </div>
  );
}
