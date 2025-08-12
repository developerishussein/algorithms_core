/// 💰 Coin Change (Minimum Coins)
///
/// Returns the minimum number of coins needed to make up [amount] using [coins].
/// Returns -1 if not possible.
///
/// Time Complexity: O(amount * n)
/// Space Complexity: O(amount)
int coinChange(List<int> coins, int amount) {
  final dp = List<int>.filled(amount + 1, amount + 1);
  dp[0] = 0;
  for (final coin in coins) {
    for (int x = coin; x <= amount; x++) {
      if (dp[x - coin] + 1 < dp[x]) {
        dp[x] = dp[x - coin] + 1;
      }
    }
  }
  return dp[amount] > amount ? -1 : dp[amount];
}
