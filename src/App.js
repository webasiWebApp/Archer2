import React, { useState, useEffect } from 'react';
import Login from './components/Login';
import ArcherDashboard from './components/ArcherDashboard';
import RecorderDashboard from './components/RecorderDashboard';

function App() {
  const [user, setUser] = useState('archer');

  useEffect(() => {
    const savedUser = localStorage.getItem('user');
    if (savedUser) setUser(JSON.parse(savedUser));
  }, []);

  const logout = () => {
    localStorage.removeItem('user');
    setUser(null);
  };

  if (!user) return <Login onLogin={setUser} />;

  return (
    <div>
      <button onClick={logout}>Logout</button>
      {user.role === 'archer' && <ArcherDashboard user={user} />}
      {user.role === 'recorder' && <RecorderDashboard user={user} />}
    </div>
  );
}

export default App;
