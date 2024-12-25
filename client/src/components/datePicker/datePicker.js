import React, { useState } from 'react';

const DatePicker = () => {
  const [selectedDate, setSelectedDate] = useState('');

  const handleDateChange = (event) => {
    setSelectedDate(event.target.value);
  };

  return (
    <div style={{ margin: '20px', textAlign: 'center' }}>
      <label htmlFor="date-picker" style={{ marginRight: '10px' }}>
        Выберите дату:
      </label>
      <input
        type="date"
        id="date-picker"
        value={selectedDate}
        onChange={handleDateChange}
        style={{ padding: '5px', fontSize: '16px' }}
      />
      {selectedDate && (
        <p style={{ marginTop: '20px' }}>
          Выбранная дата: {new Date(selectedDate).toLocaleDateString()}
        </p>
      )}
    </div>
  );
};

export default DatePicker;