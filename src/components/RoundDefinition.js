import React, { useState, useEffect } from 'react';
import axios from 'axios';

export default function RoundDefinition() {
  const [roundIdInput, setRoundIdInput] = useState('');
  const [searchedRoundId, setSearchedRoundId] = useState(null);
  const [definition, setDefinition] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (roundIdInput) {
      setSearchedRoundId(roundIdInput);
    }
  };

  useEffect(() => {
    const fetchDefinition = async () => {
      try {
        const response = await axios.get(
          `http://localhost/archer2/routes/round.php?action=definition&id=${searchedRoundId}`
        );
        setDefinition(response.data);
      } catch (err) {
        console.error('Error fetching round definition:', err);
        setError('Failed to load round definition');
      } finally {
        setLoading(false);
      }
    };

    if (searchedRoundId) {
      setLoading(true);
      setError(null);
      fetchDefinition();
    }
  }, [searchedRoundId]);

  return (
    <div>

        <h1>Round Definition</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label htmlFor="roundId">Round ID: </label>
          <input
            type="number"
            id="roundId"
            value={roundIdInput}
            onChange={(e) => setRoundIdInput(e.target.value)}
            min="1"
            required
          />
          <button type="submit">Search Round</button>
        </div>
      </form>

      {loading && <p>Loading...</p>}
      {error && <p className="error">{error}</p>}
      
      {definition && !loading && !error && (
        <div>
          <h3>{definition.name}</h3>
          <p>{definition.description}</p>
          
          <h4>Ranges</h4>
          <table>
            <thead>
              <tr>
                <th>Distance</th>
                <th>Ends</th>
                <th>Target Face</th>
              </tr>
            </thead>
            <tbody>
              {definition.ranges?.map((range, i) => (
                <tr key={i}>
                  <td>{range.distance}m</td>
                  <td>{range.ends}</td>
                  <td>{range.targetFace}cm</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}