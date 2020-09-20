export function union<T> (a: Set<T>, b: Set<T>): Set<T> {
  for (const x of b) {
    a.add(x);
  }
  return a;
}
