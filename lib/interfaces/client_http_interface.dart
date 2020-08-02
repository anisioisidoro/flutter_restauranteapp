abstract  class IClientHttp{

  Future<Map<String, dynamic>> get({String router, Map<String, dynamic> header });

  Future<Map<String, dynamic>> post({String router, Map<String, dynamic> header, Map<String, dynamic> body});
}