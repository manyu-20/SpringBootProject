
<html>
<head>
    <title>Edit Training</title>
    <!-- Add Bootstrap CSS link -->
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous" />
      </head>
<body>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="/home">Edit Training</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="ml-auto">
        <a class="nav-link text-dark" href="/home">Home</a>
    </div>
</nav>

<div class="container mt-5 bg-light" style="background-color: #e3f2fd;">

<div class="text-center mb-4">
    <h2>Edit Training</h2>
</div>

<form action="/updateTraining" method="post" class="mx-auto p-4 border border-secondary rounded bg-white" >

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

    <label for="newValue" class="form-label"><h6>New Value</h6></label>
    <input type="text" id="newValue" name="newValue" required class="form-control mb-3">

    <div class="text-center">
        <input type="submit" value="Update" class="btn btn-primary">
    </div>
</form>

</div>

<!-- Add Bootstrap JS and Popper.js scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    const startDateInput = document.getElementById("updateStartDate");
    const endDateInput = document.getElementById("updateEndDate");
    const locationInput = document.getElementById("updateLocation");
    const topicInput = document.getElementById("updateTopic");
    const newValueInput = document.getElementById("newValue");

    function toggleInputType(type) {
        if (type === "date") {
            newValueInput.type = "date";
        } else {
            newValueInput.type = "text";
        }
    }

    startDateInput.addEventListener("change", () => {
        if (startDateInput.checked) {
            toggleInputType("date");
        }
    });

    endDateInput.addEventListener("change", () => {
        if (endDateInput.checked) {
            toggleInputType("date");
        }
    });

    locationInput.addEventListener("change", () => {
        if (locationInput.checked) {
            toggleInputType("text");
        }
    });

    topicInput.addEventListener("change", () => {
        if (topicInput.checked) {
            toggleInputType("text");
        }
    });
</script>

</body>
</html>
