// Initialize Office on ready
Office.onReady((info) => {
      if (info.host === Office.HostType.Excel) {
          // Office is ready
          console.log("Office is ready.");
          document.getElementById("submitButton").onclick = handleUserInput;
      }
  });
  
  // Variables
  let userInput;
  let apiResponse;
  let dataModel = [];
  
  // Function to handle user input
  function handleUserInput() {
      // Get user input from the input field
      userInput = document.getElementById("userInput").value;
  
      if (!userInput) {
          alert("Please enter a value.");
          return;
      }
  
      // Call the API with the user input
      fetchDataFromAPI(userInput);
  }
  
  // Function to fetch data from an external API
  function fetchDataFromAPI(input) {
      const apiUrl = `https://api.example.com/data?query=${encodeURIComponent(input)}`;
      
      fetch(apiUrl)
          .then(response => {
              if (!response.ok) {
                  throw new Error("Network response was not ok " + response.statusText);
              }
              return response.json();
          })
          .then(data => {
              apiResponse = data;
              updateDataModel(apiResponse);
              displayData();
          })
          .catch(error => {
              console.error("There was a problem with the fetch operation:", error);
              alert("Error fetching data: " + error.message);
          });
  }
  
  // Function to update the data model with API response
  function updateDataModel(data) {
      // Assuming the API response is an array of objects
      dataModel = data.map(item => ({
          id: item.id,
          name: item.name,
          value: item.value,
      }));
  }
  
  // Function to display data in the Office Add-in task pane
  function displayData() {
      const outputDiv = document.getElementById("output");
      outputDiv.innerHTML = ""; // Clear previous output
  
      if (dataModel.length === 0) {
          outputDiv.innerHTML = "<p>No data available.</p>";
          return;
      }
  
      const list = document.createElement("ul");
      
      dataModel.forEach(item => {
          const listItem = document.createElement("li");
          listItem.textContent = `ID: ${item.id}, Name: ${item.name}, Value: ${item.value}`;
          list.appendChild(listItem);
      });
  
      outputDiv.appendChild(list);
  }
  