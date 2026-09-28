shader_type particles;
render_mode disable_velocity;

uniform float orbit_radius = 0.5;
uniform float orbit_speed = 0.8;

void start() {
    ACTIVE = true;
}

void process() {
    // Each shield gets its own position on the orbit.
    float angle = TIME * orbit_speed
        + float(INDEX) * TAU / 4.0;

    vec3 pos = vec3(
        cos(angle) * orbit_radius,
        0.0,
        sin(angle) * orbit_radius
    );

    // Keep the shield facing radially outward.
    // Its local +Z direction points away from the center.
    vec3 right = vec3(
        sin(angle),
        0.0,
        -cos(angle)
    );

    vec3 up = vec3(0.0, 1.0, 0.0);
    vec3 forward = vec3(
        cos(angle),
        0.0,
        sin(angle)
    );

    // Set orientation and position.
    TRANSFORM = mat4(
        vec4(right, 0.0),
        vec4(up, 0.0),
        vec4(forward, 0.0),
        vec4(pos, 1.0)
    );
}