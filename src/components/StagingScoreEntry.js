import React, { useState } from 'react';
import axios from 'axios';

export default function StagingScoreEntry({ archerId }) {
  const [form, setForm] = useState({
    Date: '',
    Time: '',
    RoundID: '',
    Score: '',
    EquipmentID: '',
  });
  const [msg, setMsg] = useState(null);

  const handleChange = e => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async e => {
    e.preventDefault();
    setMsg(null);
    try {
      await axios.post(`http://localhost/archer2/routes/archer.php?action=staging-score&id=${archerId}`, form);
      setMsg('Score staged successfully!');
      setForm({ Date: '', Time: '', RoundID: '', Score: '', EquipmentID: '' });
    } catch (err) {
      setMsg('Error submitting score');
    }
  };

  return (
    <div>
      <h3>Enter Staging Score</h3>
      {msg && <p>{msg}</p>}
      <form onSubmit={handleSubmit}>
        <label>
          Date:
          <input type="date" name="Date" value={form.Date} onChange={handleChange} required />
        </label><br />
        <label>
          Time:
          <input type="time" name="Time" value={form.Time} onChange={handleChange} required />
        </label><br />
        <label>
          Round ID:
          <input type="number" name="RoundID" value={form.RoundID} onChange={handleChange} required />
        </label><br />
        <label>
          Score:
          <input type="number" name="Score" value={form.Score} onChange={handleChange} required />
        </label><br />
        <label>
          Equipment ID:
          <input type="number" name="EquipmentID" value={form.EquipmentID} onChange={handleChange} required />
        </label><br />
        <button type="submit">Submit Staging Score</button>
      </form>
    </div>
  );
}
