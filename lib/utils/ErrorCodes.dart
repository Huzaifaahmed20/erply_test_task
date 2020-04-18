class ErrorCodes {
  Map<int, String> _messages = {
    1000: "API is under maintenance, please try again in a couple of minutes.",
    1001:
        "Account not found. (It may also mean that input parameter 'clientCode' is missing.)",
    1002:
        "Hourly request quota (by default 2000 requests) has been exceeded for this account. Please resume next hour.",
    1003: "Cannot connect to account database.",
    1005:
        "API call name (input parameter 'request') not specified, or unknown API call.",
    1006:
        "This API call is not available on this account. (Account needs upgrading, or an extra module needs to be installed.)",
    1007:
        "Unknown output format requested; input parameter 'responseType' must be set to",
    1008:
        "Either a) database is under regular maintenance (please try again in a couple of minutes), or b) your application is not connecting to the correct API server.",
    1009:
        "This API call requires authentication parameters (a session key, authentication key, or service key), but none were found.",
    1010:
        "Required parameters are missing. (Attribute 'errorField' indicates the missing input parameter.)",
    1011:
        "Invalid classifier ID, there is no such item. (Attribute 'errorField' indicates the invalid input parameter.)",
    1012:
        "A parameter must have a unique value. (Attribute 'errorField' indicates the invalid input parameter.)",
    1013:
        "Inconsistent parameter set (for example, both product and service IDs specified for an invoice row).",
    1014:
        "	Incorrect data type or format. (Attribute 'errorField' indicates the invalid input parameter.)",
    1015: "	Malformed request (eg. parameters containing invalid characters).",
    1016:
        "Invalid value. (Attribute 'errorField' indicates the field that contains an invalid value.)",
    1017:
        "Document has been confirmed and its contents and warehouse ID cannot be edited any more.",
    1018:
        "	Multiple matches found, all have the same attribute value. No records will be updated.",
    1019: "No records found with this attribute value.",
    1050: "Username/password missing.",
    1051: "Login failed.",
    1052:
        "	User has been temporarily blocked because of repeated unsuccessful login attempts.",
    1053:
        "No password has been set for this user, therefore the user cannot be logged in.",
    1054:
        "API session has expired. Please call API 'verifyUser' again (with correct credentials) to receive a new session key.",
    1055: "Supplied session key is invalid; session not found.",
    1056:
        "	Supplied session key is too old. User switching is no longer possible with this session key, please perform a full re-authentication via API 'verifyUser'.",
    1057:
        "Your time-limited demo account has expired. Please create a new ERPLY demo account, or sign up for a paid account.",
    1058:
        "PIN login is not supported. Provide a user name and password instead, or use the 'switchUser' API call.",
    1059: "Unable to detect your user group."
  };

  Map<int, String> get errorMessage => _messages;
}
