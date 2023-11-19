<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form in Laravel</title>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.css' />
</head>

<body>
    <div class="d-flex justify-content-center">
        <form action="/form" method="POST" enctype="multipart/form-data"><br><br><br>
            @csrf
            <h2>Collect Form Data</h2>
            <div class="form-outline mb-4">
                <label class="form-label" for="form1Example1">Full Name</label>
                <input type="name" id="name" name="name" class="form-control" />
            </div>
            <div class="form-outline mb-4">
                <label class="form-label" for="form1Example1">Email address</label>
                <input type="email" id="email" name="email" class="form-control" />
            </div>
            <!-- <div class="form-outline mb-4">
                <input type="password" id="form1Example2" class="form-control" />
                <label class="form-label" for="form1Example2">Password</label>
            </div> -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form1Example1">Upload Image</label><br>
                <input type="file" name="image" id="image" class="form-control">
            </div>
            
            <button type="submit" name="submit" class="btn btn-primary btn-block">Submit</button>
        </form>
    </div>
</body>

</html>