# aigifmaker snap

Turn text into animated GIFs with AI GIF Maker. Native GIF generation — no video conversion. Type what you want and download your GIF in about a minute.

Snap package of the official [AI GIF Maker](https://aigifmaker.ai/?utm_source=snapcraft&utm_medium=package) CLI.

```
sudo snap install aigifmaker
export AIGIFMAKER_API_KEY=sk-...   # from https://aigifmaker.ai/settings/apikeys
aigifmaker "a cat dancing in the rain, pixel art"
aigifmaker credits
```

Each GIF costs 1 credit on your AI GIF Maker account, the same as on the website. New accounts get one free GIF (it carries a small aigifmaker.ai badge). Credits and plans are on the [pricing](https://aigifmaker.ai/pricing?utm_source=snapcraft&utm_medium=package) page.

`build.sh` packs the `aigifmaker-linux-{amd64,arm64}` assets of [aigifmaker-go v0.1.1](https://github.com/hanshs474/aigifmaker-go/releases/tag/v0.1.1) into `.snap` files (no snapcraft or LXD needed); `upload.sh` registers the name and pushes + releases both snaps to the stable channel with craft-store. MIT licensed.
