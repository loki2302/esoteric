#[test]
fn can_use_for_loop() {
  let mut sum: int = 0;
  for i in range(0i, 10i) {
    sum += i;
  }
  assert_eq!(45, sum);
}
