class Llmrace < Formula
  desc "Race LLM providers head-to-head in your terminal: latency, TTFB, tokens/s, p95 and cost"
  homepage "https://github.com/dfbustosus/llmrace"
  url "https://github.com/dfbustosus/llmrace/releases/download/v1.5.0/llmrace-v1.5.0-aarch64-apple-darwin.tar.gz"
  version "1.5.0"
  sha256 "74dee9f13ea217d99e8fddc163ccbefe3c9c9ec97cea94e1decc28b11b6ffd5c"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_intel do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.5.0/llmrace-v1.5.0-x86_64-apple-darwin.tar.gz"
    sha256 "c3802f91484d45aaf904464292596f86c6ce2f082d2a5fce7742ac3c037e8159"
  end

  on_linux do
    url "https://github.com/dfbustosus/llmrace/releases/download/v1.5.0/llmrace-v1.5.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "15862bd202373f1cb42a704438bd8e87edc3d07279e814bc4e5d7abc5976d050"
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
