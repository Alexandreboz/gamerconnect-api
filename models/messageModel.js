class Message {
    constructor(id, id_envoyeur, id_recepteur, contenu, date_envoi) {
      this.id = id;
      this.id_envoyeur = id_envoyeur;
      this.id_recepteur = id_recepteur;
      this.contenu = contenu;
      this.date_envoi = date_envoi;
    }
  }
  module.exports = Message;
  