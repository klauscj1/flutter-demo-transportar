class Ciudad {
  String nombre;

  Ciudad({
    this.nombre,
  });

  factory Ciudad.fromJson(Map<String, dynamic> json) => Ciudad(
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
      };
}
