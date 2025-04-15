import 'package:googleapis_auth/auth_io.dart';

class GetServerKey{
  Future<String> getServerKey()async{
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(ServiceAccountCredentials.fromJson(
        {
          "type": "service_account",
          "project_id": "foodys-7b4be",
          "private_key_id": "42cac78612e04e1399cfc9fa4cf974a6e2b9f6c4",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDayOjAejKD5R16\n"
              "0I3yrDHqg6s3mI269kIEgfJ7LmmPMxzhXVxMk1rqpfGmx+AiUEyBgaaK/PN0UWwD\n"
              "p/T2Qe4+ncxO8WrvTbW0L4Kxm5uXQcP3ZuoAAGj6exgPLdbAfkQvyc7L2T07yjaD\n"
              "zQkzebA1YDMds5k5MGAJ0dT89lGZUEwsr1hQCP7moS7bmxLeBTckYgdSlaaSM/zq\n"
              "1j6fyEFp0XOdaDE6BwCqiQ3bRis17OryJs8tAMG5NuJp70mh6FQqtxRac5x2kI4i\n"
              "/HhBGmJn1cb06o/6ZDo2kS0N+nITXSXiYsHjRK0bnHWzX5ZGmfP6RsDW85pg/kB+\n"
              "gv0GWMOHAgMBAAECggEAFaBIMlJ1FzvsCvcXhbY6S7POyY5fICAPplHQzeO1R0ez\n"
              "O9GjLUyTImB1DECnA2B/MRct07PgpFqyCLbiJcw3+3q7A2ilfD8cGwU0b+lX2v7P\n"
              "59VSUKq5tcMgimUqqT9lId/BMCQ3ac2stgcfH2mQnrR1VdYqN91z+M4dgndRcvJ7\n"
              "el5RpoGVDsp2HgrtBW1WMzqqC5GJcrXiYLONjDRZ3fDQ3pDE2CKNgk83hGIz6f9n\n"
              "w0HAdvZXF/lnXd+jOELUJxC3YMXTLaXAE8ZP+UMu9VIBYnxArCBiw2Ic9HRN47Mh\n"
              "cyFd85EWn8G1imPfOaCeFNBZDISbE1hNxZhR5gB+QQKBgQD0ThSORnf73A/8EWi+\n"
              "iJ8FcdBP3Vw5jXu4TSBdalovJ2yK/homS3WBp7HLxusUBGN6VeyIR96ee7IJ5Q4g\n"
              "M81tAdc8cfSa75usCo3t53zUL2Xi1HIWPdPmt8yH1ry4VzE/XpBCNA/J/qY5rjJy\n"
              "B3fDTVs7jg9IFSlvgYzReQSOwQKBgQDlQhUz33J3UMEAsWjLUsvwfpzXhnh3xvnZ\n"
              "JOVDdqFf2U4mZrCwxJ3M287iHVRbW5Aw6sK+JbF9dXLR8roVPpZG4Tve4i1XKs3R\n"
              "o6Y6GS/40855BK0hc2X2qUpJ+nz1yj81+IuSsOyN4SN4dW4TmgzlysI64c2+x0ML\n"
              "6cGcnIwsRwKBgEN+lts/yMJCaAAh5yhMonJkoUKPS31zAy1F0Z09VrEUWT6FOUA/\n"
              "NLWfWNWNnUCofbs8pd54zJ5IWkW1jJOE/EoTah1+9i8f54g+WjvR6oDMn39tZh+S\n"
              "8UoamV0mDHl5TVfOjlhb/ci2m8HvyGwMeB/y7TOk6b/maM4vonH01zeBAoGAEVY5\n"
              "/D49jcBRmBfScO3F9l3cxn+oxIYLhtw/aiaidXkda9IAMp3rwP4uWvMU2gPGl6xp\n"
              "Ja/8CBzFnhLY95pQCvQlbulzvE/EWMIjY+lbs1lxF72+yfTMFScgMw/6OywcM5yk\n"
              "EWfHu8L2x7k5pcnUh9wZbBJ/WJoA+/mlZo6AGykCgYB8oDJTlxWZS5EUJfod/asn\n"
              "hHuAFU1fRNNn4u33huWIj5V0iU9AP4KkYRnepgSA1hP09x307+3o+mmCea8Cw7HO\n"
              "6nrs8lHL0lwi/e6A735t4Gd4M8iYVh2vDPF47x3Bg3kOZozLh6rx8J9WM6cpjiir\n"
              "UNwgFDXAwlnTN8G0grJ8+Q==\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-ja1vz@foodys-7b4be.iam.gserviceaccount.com",
          "client_id": "110008400093322140477",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ja1vz%40foodys-7b4be.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }
    ), scopes);
    final accessServerKey = client.credentials.accessToken.data;
    return accessServerKey;
  }
}