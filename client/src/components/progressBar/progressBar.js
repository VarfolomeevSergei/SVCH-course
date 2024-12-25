import React from 'react';

const ProgressBar = ({ progress, max }) => {
  const percentage = (progress / max) * 100;

  return (
    <div style={{ width: '100%', backgroundColor: '#e0e0e0', borderRadius: '5px', overflow: 'hidden' }}>
      <div
        style={{
          width: `${percentage}%`,
          backgroundColor: '#76c7c0',
          height: '20px',
          transition: 'width 0.3s ease',
        }}
      />
    </div>
  );
};

export default ProgressBar;