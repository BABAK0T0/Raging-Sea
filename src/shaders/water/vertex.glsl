uniform float uTime;
uniform float uBigWavesElevation;
uniform vec2 uBigWavesFrequency;
uniform float uBigWavesSpeed;

void main() {
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    /**
    * Frequency
    *
    * uBigWavesFrequency.y because it's a vec2(x,y) 
    * uBigWavesFrequency.y represents the z axis in this case
    */
    float frequencyX = sin(modelPosition.x * uBigWavesFrequency.x + uTime * uBigWavesSpeed);
    float frequencyZ = sin(modelPosition.z * uBigWavesFrequency.y + uTime * uBigWavesSpeed);

    // Elevation
    float elevation =  frequencyX * frequencyZ * uBigWavesElevation;
    modelPosition.y += elevation;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;
}