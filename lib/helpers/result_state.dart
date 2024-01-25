// Enum to represent the different states of an asynchronous operation
enum ResultState {
  loading, // Indicates that data is still being loaded
  noData, // Indicates that no data is available
  hasData, // Indicates that data has been successfully loaded
  error // Indicates that an error occurred during the data loading process
}
