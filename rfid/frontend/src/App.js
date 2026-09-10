import React, { useState } from 'react';
import axios from 'axios';
import './App.css';

const App = () => {
  const [rfidId, setRfidId] = useState('');
  const [attendanceRecords, setAttendanceRecords] = useState([]);
  const [subjectWiseAttendance, setSubjectWiseAttendance] = useState({});
  const [attendancePercentages, setAttendancePercentages] = useState([]);
  const [error, setError] = useState('');

  const handleInputChange = (e) => {
    setRfidId(e.target.value);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.get('http://localhost:3001/attendance', {
        params: {
          rfid_id: rfidId
        }
      });
      setAttendanceRecords(response.data);  
      setError('');
    } catch (err) {
      setError('Error fetching data');
      setAttendanceRecords([]);
    }
  };

  const handleSubjectWiseSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.get('http://localhost:3001/attendance/subjectwise', {
        params: {
          rfid_id: rfidId
        }
      });
      setSubjectWiseAttendance(response.data);
      setError('');
    } catch (err) {
      setError('Error fetching data');
      setSubjectWiseAttendance({});
    }
  };

  const handlePercentageSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.get('http://localhost:3001/attendance/percentage', {
        params: {
          rfid_id: rfidId
        }
      });
      setAttendancePercentages(response.data);
      setError('');
    } catch (err) {
      setError('Error fetching data');
      setAttendancePercentages([]);
    }
  };

  return (
    <div className="App">
      <h1>Check Attendance</h1>
      <form>
        <label>
          RFID ID:
          <input
            type="text"
            value={rfidId}
            onChange={handleInputChange}
            required
          />
        </label>
        <button onClick={handleSubmit}>Get Attendance</button>
        <button onClick={handleSubjectWiseSubmit}>
          Get Subject-Wise Attendance
        </button>
        <button onClick={handlePercentageSubmit}>
          Get Attendance Percentage
        </button>
      </form>

      {error && <p style={{ color: 'red' }}>{error}</p>}

      {attendanceRecords.length > 0 && (
        <div>
          <h2>Attendance Details</h2>
          <table>
            <thead>
              <tr>
                <th>Date</th>
                <th>Time</th>
                <th>Subject</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              {attendanceRecords.map((record, index) => (
                <tr key={index}>
                  <td>{record.date}</td>
                  <td>{record.time}</td>
                  <td>{record.subject}</td>
                  <td>{record.status}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {Object.keys(subjectWiseAttendance).length > 0 && (
        <div>
          <h2>Subject-Wise Attendance</h2>
          {Object.entries(subjectWiseAttendance).map(([subject, records], index) => (
            <div key={index}>
              <h3>{subject}</h3>
              <table>
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  {records.map((record, idx) => (
                    <tr key={idx}>
                      <td>{record.date}</td>
                      <td>{record.time}</td>
                      <td>{record.status}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          ))}
        </div>
      )}

      {attendancePercentages.length > 0 && (
        <div>
          <h2>Attendance Percentage</h2>
          <table>
            <thead>
              <tr>
                <th>Subject</th>
                <th>Percentage</th>
              </tr>
            </thead>
            <tbody>
              {attendancePercentages.map((record, index) => (
                <tr key={index}>
                  <td>{record.subject}</td>
                  <td>{record.percentage}%</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
};

export default App;
