let
    Api = "https://just-ask.raw-labs.com/api/.../YOURENDPOINT",
    Data =
        Web.Contents(
            Api,
            [
                Headers = [
                    #"X-RAW-output-format" = "json",
                    Authorization = "Bearer …YOURTOKEN…."
                ]
            ]
        ),
    JsonData = Json.Document(Data),
    #"QueryResult" =
        Table.FromList(
            JsonData,
            Splitter.SplitByNothing(),
            ExtraValues.Error
        )
in
    #"QueryResult"
    
