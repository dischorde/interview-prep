// Question 41
const findDuplicate = (arr) => {
  // current starts at head, which is at index n
  let n = arr.length - 1;
  let current = n;
  // n times, move the current index to that of the next "node"
  for (let i = 0; i < n; i++) {
    // current idx = position - 1
    current = arr[current] - 1;
  }

  let cycleLen = 1;
  let ahead = arr[current] - 1;
  while (ahead !== current) {
    ahead = arr[ahead] - 1;
    cycleLen++;
  }

  // initialize current to head
  current = n;
  // move ahead cycleLen places forward
  ahead = current;
  for (let j = 0; j < cycleLen; j++) {
    ahead = arr[ahead] - 1;
  }

  while (current !== ahead) {
    current = arr[current] - 1;
    ahead = arr[ahead] - 1;
  }

  return current + 1;
};
