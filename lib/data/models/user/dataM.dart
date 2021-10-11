// get generate model on data/models/user  with lib/json/user.json
//http://survey.khansia.co.id/api/offeneVerschlussel

class Data {
    Data({
        this.iduser,
        this.username,
        this.name,
        this.role,
        this.status,
        this.retries,
        this.token,
        this.updateDate,
    });

    dynamic iduser;
    dynamic username;
    dynamic name;
    dynamic role;
    dynamic status;
    dynamic retries;
    dynamic token;
    dynamic updateDate;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        iduser: json["iduser"],
        username: json["username"],
        name: json["name"],
        role: json["role"],
        status: json["status"],
        retries: json["retries"],
        token: json["token"],
        updateDate: json["update_date"],
    );

    Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "username": username,
        "name": name,
        "role": role,
        "status": status,
        "retries": retries,
        "token": token,
        "update_date": updateDate,
    };
}
