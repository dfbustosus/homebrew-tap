class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v0.4.1/llmrace-v0.4.1-aarch64-apple-darwin.tar.gz"
  version "0.4.1"
  sha256 "36ed3231eaf91c877aa3ef283d13c2621f34902ad1914de9e6db416e9d537988"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.4.1/llmrace-v0.4.1-x86_64-apple-darwin.tar.gz"
    sha256 "576f1780b8835393f1b18f162f4238a89cdf755295e4a8c2446a88adf914fa30"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.4.1/llmrace-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "507ebbc331fe8771c875313edcdcc0757138f99825e4bdace58c9f6204c733f4"
  end

  def install
    bin.install "bin/llmrace"
  end

  def caveats
    <<~EOS
      Providers are auto-detected from the environment:
      OPENAI_API_KEY, ANTHROPIC_API_KEY, GEMINI_API_KEY, GROQ_API_KEY,
      DEEPSEEK_API_KEY, MISTRAL_API_KEY, TOGETHER_API_KEY, FIREWORKS_API_KEY,
      CEREBRAS_API_KEY, OPENROUTER_API_KEY, or a local Ollama daemon.
    EOS
  end

  test do
    assert_match "llmrace", shell_output("#{bin}/llmrace --version")
  end
end
