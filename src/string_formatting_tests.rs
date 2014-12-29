#[test]
fn can_format_hello_world_string() {
  let s: String = format!("Hello, {}!", "World");
  assert_eq!("Hello, World!", s);
}

#[test]
fn can_format_with_numbers() {
  let s: String = format!("pi={}", 3.14f32);
  assert_eq!("pi=3.14", s);
}
