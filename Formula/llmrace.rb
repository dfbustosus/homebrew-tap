class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v0.7.0/llmrace-v0.7.0-aarch64-apple-darwin.tar.gz"
  version "0.7.0"
  sha256 "071c563f7c17a270dfa9aab5d69388e217b8b9c9902211a6fe4e989ba96392ed"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.7.0/llmrace-v0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "dcab82baef9ef54e95343729820af1c8d18d289dcfdebf1824d47a7114afbb80"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.7.0/llmrace-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "93b3ceaf45061ba839edb6b3b5a824532b87425e92d45682de01b2faba3c3e23"
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
