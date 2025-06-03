import React from 'react';
import RecorderArcherForm from './RecorderArcherForm';
import RecorderPendingScores from './RecorderPendingScores';
import PersonalBest from './PersonalBest';
import ClubBest from './ClubBest';
import CompetitionResults from './CompetitionResults';
import ArrowScoreEntry from './ArrowScoreEntry';
import RoundsList from './RoundsList';
import CompetitionsList from './CompetitionsList';

export default function RecorderDashboard() {
  return (
    <div>
      {/* <h1>Recorder Dashboard</h1>
      <RecorderArcherForm />
      <RecorderPendingScores /> */}

       <h1>Recorder Dashboard</h1>
      {/* Existing components */}
      <RecorderArcherForm />
      <RecorderPendingScores />
      {/* New components */}
      <ArrowScoreEntry />
      <RoundsList />
      <CompetitionsList />
      <PersonalBest archerId={1} /> {/* Example with hardcoded archerId or pass dynamically */}
      <ClubBest />
      <CompetitionResults />
    </div>
  );
}
