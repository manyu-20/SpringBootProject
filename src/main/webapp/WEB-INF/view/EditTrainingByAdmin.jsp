
<html>
<head>
    <title>Edit Training</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5 bg-light">

<div class="text-center mb-4">
    <h2>Edit Training</h2>
</div>

<form action="/updateTraining" method="post" class="mx-auto p-4 border border-secondary rounded bg-white">

    <label for="id" class="form-label"><h3>Training ID: ${id}</h3></label><br>
    <input type="hidden" id="id" name="id" value="${id}" required class="form-control mb-3">

    <label class="form-label"><h6>Select the item</h6></label><br>
    <div class="form-check mb-3">
        <input type="radio" id="updateLocation" name="updateType" value="updateLocation" class="form-check-input">
        <label for="updateLocation" class="form-check-label">Update Location</label>
    </div>

    <div class="form-check mb-3">
        <input type="radio" id="updateTopic" name="updateType" value="updateTopic" class="form-check-input">
        <label for="updateTopic" class="form-check-label">Update Topic</label>
    </div>

    <div class="form-check mb-3">
        <input type="radio" id="updateStartDate" name="updateType" value="updateStartDate" class="form-check-input">
        <label for="updateStartDate" class="form-check-label">Update Start Date</label>
    </div>

    <div class="form-check mb-3">
        <input type="radio" id="updateEndDate" name="updateType" value="updateEndDate" class="form-check-input">
        <label for="updateEndDate" class="form-check-label">Update End Date</label>
    </div>

    <label for="newValue" class="form-label"><h6>New Value:</h6></label>
    <input type="text" id="newValue" name="newValue" required class="form-control mb-3">

    <div class="text-center">
        <input type="submit" value="Update" class="btn btn-primary">
    </div>
</form>

<!-- Add Bootstrap JS and Popper.js scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
