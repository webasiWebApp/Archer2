import React, { useState, useEffect } from 'react';
import axios from 'axios';

export default function CompetitionsList() {
  const [competitions, setCompetitions] = useState([]);
  const [newComp, setNewComp] = useState({ CompetitionName: '', Description: '', Date: '' });
  const [msg, setMsg] = useState(null);

  const fetchCompetitions = async () => {
    try {
      const res = await axios.get('http://localhost/archer2/routes/competition.php?action=list');
      setCompetitions(res.data);
    } catch (err) {
      console.error(err);
    }
  };

  useEffect(() => {
    fetchCompetitions();
  }, []);

  const handleChange = e => setNewComp({ ...newComp, [e.target.name]: e.target.value });

  const handleSubmit = async e => {
    e.preventDefault();
    setMsg(null);
    try {
      await axios.post('http://localhost/archer2/routes/competition.php?action=add', newComp);
      setMsg('Competition added');
      setNewComp({ CompetitionName: '', Description: '', Date: '' });
      fetchCompetitions();
    } catch {
      setMsg('Error adding competition');
    }
  };

  return (
    <div>
      <h3>Competitions</h3>
      <ul>
        {competitions.map(c => (
          <li key={c.CompetitionID}>{c.CompetitionName} - {c.Date} - {c.Description}</li>
        ))}
      </ul>

      <h4>Add New Competition</h4>
      {msg && <p>{msg}</p>}
      <form onSubmit={handleSubmit}>
        <input name="CompetitionName" placeholder="Name" value={newComp.CompetitionName} onChange={handleChange} required />
        <input name="Description" placeholder="Description" value={newComp.Description} onChange={handleChange} />
        <input type="date" name="Date" value={newComp.Date} onChange={handleChange} required />
        <button type="submit">Add Competition</button>
      </form>
    </div>
  );
}
