import express from 'express';
import pkg from 'pg';
import bodyParser from 'body-parser';
import cors from 'cors';
import dotenv from 'dotenv';

dotenv.config();  // load .env

const { Pool } = pkg;

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// PostgreSQL connection pool using environment variable
const pool = new Pool({
  connectionString: process.env.DB_URL
});

// Test the connection
pool.connect()
  .then(() => console.log('✅ Connected to PostgreSQL'))
  .catch(err => console.error('❌ Database connection error:', err));

app.get('/', (req, res) => {
  res.send('Server is running...');
});

app.get("/projects", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM projects ORDER BY id ASC");
    res.json(result.rows);
  } catch (err) {
    console.error("Error fetching projects:", err);
    res.status(500).json({ error: "Something went wrong" });
  }
});


app.get("/team", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM team ORDER BY id ASC");
    res.json(result.rows);
  } catch (err) {
    console.error("❌ Error fetching team:", err);
    res.status(500).json({ error: "Something went wrong" });
  }
});

app.get("/services", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM services ORDER BY id ASC");
    res.json(result.rows);
  } catch (err) {
    console.error("❌ Error fetching services:", err);
    res.status(500).json({ error: "Something went wrong" });
  }
});


app.get("/plans", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM plans ORDER BY id ASC");
    res.json(result.rows);
  } catch (err) {
    console.error("❌ Error fetching plans:", err);
    res.status(500).json({ error: "Something went wrong" });
  }
});


// Start server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
