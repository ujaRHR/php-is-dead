<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Response</title>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.css' />
</head>

<body>
    <br><br><br>
    <div class="d-flex justify-content-center">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Form Response</h5>
                <p class="card-text">
                    <strong>Full Name:</strong> {{$name}} <br>
                    <strong>Email:</strong> {{$email}} <br>
                    <strong>Image:</strong> {{$imagePath}} <br>
                    <br>
                    <center>
                        <img src="{{asset('images/'.$imagePath)}}" width="200px">
                    </center>
                </p>
            </div>
        </div>
    </div>
</body>

</html>