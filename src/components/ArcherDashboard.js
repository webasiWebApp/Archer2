import React from 'react';
import ArcherScores from './ArcherScores';
import StagingScoreEntry from './StagingScoreEntry';
import RoundsList from './RoundsList';
import CompetitionsList from './CompetitionsList';
import RecorderArcherForm from './RecorderArcherForm';
import RecorderPendingScores from './RecorderPendingScores';
import RoundDefinition from './RoundDefinition';
import PersonalBest from './PersonalBest';
import ClubBest from './ClubBest';
import CompetitionResults from './CompetitionResults';

export default function ArcherDashboard({ user }) {
  return (
    <div>
      <h1>Welcome, {user.username}</h1>
      <StagingScoreEntry archerId={user.archerId} />
      <ArcherScores archerId={user.archerId} />
      {/* <RecorderArcherForm />
      <RecorderPendingScores /> */}
      <RoundsList />
      <CompetitionsList />
      <RoundDefinition/>
      <PersonalBest archerId={1} />
      <ClubBest />
      <CompetitionResults />
    </div>
  );
}
