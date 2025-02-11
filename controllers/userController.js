const db = require("../database");

exports.createUser = (req, res) => {
  const { nom, prenom, email, mot_de_passe, plateformes } = req.body;
  const query = "INSERT INTO Utilisateurs (nom, prenom, email, mot_de_passe, plateformes_liees) VALUES (?, ?, ?, ?, ?)";
  db.query(query, [nom, prenom, email, mot_de_passe, plateformes], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.status(201).json({ id: result.insertId });
  });
};

exports.getUsers = (req, res) => {
  const query = "SELECT * FROM Utilisateurs";
  db.query(query, (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json(results);
  });
};