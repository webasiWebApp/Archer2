import React, { useState } from 'react';
import axios from 'axios';

export default function ArrowScoreEntry() {
  const [scoreId, setScoreId] = useState('');
  const [arrows, setArrows] = useState([{ RangeNo: 1, EndNo: 1, ArrowNo: 1, Value: '' }]);
  const [msg, setMsg] = useState(null);

  const addArrow = () => setArrows([...arrows, { RangeNo: 1, EndNo: 1, ArrowNo: arrows.length + 1, Value: '' }]);

  const updateArrow = (index, field, val) => {
    const newArrows = [...arrows];
    newArrows[index][field] = field === 'Value' ? Number(val) : val;
    setArrows(newArrows);
  };

  const handleSubmit = async e => {
    e.preventDefault();
    setMsg(null);
    if (!scoreId) {
      setMsg('Score ID required');
      return;
    }
    try {
      await axios.post('http://localhost/archer2/routes/recorder.php?action=arrow-scores', { ScoreID: Number(scoreId), Arrows: arrows });
      setMsg('Arrow scores submitted');
      setScoreId('');
      setArrows([{ RangeNo: 1, EndNo: 1, ArrowNo: 1, Value: '' }]);
    } catch {
      setMsg('Error submitting arrow scores');
    }
  };

  return (
    <div>
      <h3>Arrow-by-Arrow Score Entry</h3>
      {msg && <p>{msg}</p>}
      <form onSubmit={handleSubmit}>
        <label>
          Score ID:
          <input value={scoreId} onChange={e => setScoreId(e.target.value)} required />
        </label>
        <br />
        {arrows.map((arrow, i) => (
          <div key={i}>
            <label>
              Range No:
              <input type="number" value={arrow.RangeNo} min="1" onChange={e => updateArrow(i, 'RangeNo', e.target.value)} required />
            </label>
            <label>
              End No:
              <input type="number" value={arrow.EndNo} min="1" onChange={e => updateArrow(i, 'EndNo', e.target.value)} required />
            </label>
            {/* <label>
              Arrow No:
              <input type="number" value={arrow.ArrowNo} min="1" onChange={e => updateArrow(i, 'ArrowNo', e.target.value)} required />
            </label> */}
            <label>
              Value:
              <input type="number" value={arrow.Value} min="0" max="10" onChange={e => updateArrow(i, 'Value', e.target.value)} required />
            </label>
          </div>
        ))}
        <button type="button" onClick={addArrow}>Add Arrow</button><br />
        <button type="submit">Submit Arrow Scores</button>
      </form>
    </div>
  );
}
