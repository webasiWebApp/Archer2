import React, { useState } from 'react';
import axios from 'axios';

export default function RecorderArcherForm() {
  const [form, setForm] = useState({
    FirstName: '',
    LastName: '',
    DOB: '',
    Gender: 'M',
    CategoryID: '',
  });
  const [msg, setMsg] = useState(null);

  const handleChange = e => setForm({ ...form, [e.target.name]: e.target.value });

  const handleSubmit = async e => {
    e.preventDefault();
    setMsg(null);
    try {
      await axios.post('http://localhost/archer2/routes/recorder.php?action=archer', form);
      setMsg('Archer added successfully!');
      setForm({ FirstName: '', LastName: '', DOB: '', Gender: 'M', CategoryID: '' });
    } catch (err) {
      setMsg('Error adding archer');
    }
  };

  return (
    <div>
      <h3>Add New Archer</h3>
      {msg && <p>{msg}</p>}
      <form onSubmit={handleSubmit}>
        <label>
          First Name:
          <input name="FirstName" value={form.FirstName} onChange={handleChange} required />
        </label><br />
        <label>
          Last Name:
          <input name="LastName" value={form.LastName} onChange={handleChange} required />
        </label><br />
        <label>
          DOB:
          <input type="date" name="DOB" value={form.DOB} onChange={handleChange} required />
        </label><br />
        <label>
          Gender:
          <select name="Gender" value={form.Gender} onChange={handleChange}>
            <option value="M">Male</option>
            <option value="F">Female</option>
          </select>
        </label><br />
        <label>
          Category ID:
          <input name="CategoryID" value={form.CategoryID} onChange={handleChange} required />
        </label><br />
        <button type="submit">Add Archer</button>
      </form>
    </div>
  );
}
