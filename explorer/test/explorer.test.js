// Simple test for the explorer
const request = require('supertest');
const app = require('../app');

describe('Explorer API', () => {
  test('should respond to /api/stats', async () => {
    const response = await request(app).get('/api/stats');
    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty('blockHeight');
    expect(response.body).toHaveProperty('txCount');
  });

  test('should respond to home page', async () => {
    const response = await request(app).get('/');
    expect(response.status).toBe(200);
  });
});
