class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v0.4.2/llmrace-v0.4.2-aarch64-apple-darwin.tar.gz"
  version "0.4.2"
  sha256 "f1813004da281a81544fc14ce533e9666f873aa134b70cc1124c618bf656e852"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.4.2/llmrace-v0.4.2-x86_64-apple-darwin.tar.gz"
    sha256 "a6af09dc2eea3bd1341b236dacfa480da926e10af0835e00c5c14e460197ace0"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v0.4.2/llmrace-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e455dd995fe7634b932a02dfa188d532a79277f61ce9e835b395720bea99f8e4"
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
