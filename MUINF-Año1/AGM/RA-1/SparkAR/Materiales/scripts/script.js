// Load in modules
const Scene = require('Scene');
const FaceTracking = require('FaceTracking');
const Reactive = require('Reactive');

(async function () {  // Enables async/await in JS [part 1]

  // Find the object called 'star'
  const star = await Scene.root.findFirst('star');
  // Create a reference of the face
  const face = FaceTracking.face(0);

  // Maps mouth openness value to a 1.5-2.5 range
  const mouthOpenness = face.mouth.openness.toRange(0.05,0.15);

  // Bind the cube's scale to mouth openness signal
  star.transform.scale = Reactive.point(mouthOpenness, mouthOpenness, mouthOpenness);

})(); // Enables async/await in JS [part 2]
