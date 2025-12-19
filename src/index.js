import pg from "pg";
const { Client } = pg;

const client = new Client({
  host: "localhost",
  port: 5432,
  user: "postgres",
  password: "postgres",
  database: "booking_db",
});

async function main() {
  try {
    // подключение к базе
    await client.connect();
    console.log("✅ Connected to database");

    // SELECT + JOIN (главное для курсовой)
    const result = await client.query(`
      SELECT
        u.full_name,
        r.name AS resource_name,
        b.booking_date
      FROM bookings b
      JOIN users u ON b.user_id = u.id
      JOIN resources r ON b.resource_id = r.id;
    `);

    console.log("📋 Bookings:");
    console.table(result.rows);

  } catch (error) {
    console.error("❌ Error:", error.message);
  } finally {
    await client.end();
    console.log("🔌 Connection closed");
  }
}

main();

