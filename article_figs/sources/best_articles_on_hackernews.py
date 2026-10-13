from datetime import datetime
import requests

top_ids = requests.get(
  "https://hacker-news.firebaseio.com/v0/topstories.json"
).json()

for story_id in top_ids[:30]:
  story = requests.get(
    f"https://hacker-news.firebaseio.com/v0/item/{story_id}.json"
  ).json()

  if story.get("score", 0) >= 100:
    score = story["score"]

    # UNIX epoch to YYYY-MM-DD HH:MM:SS
    posted_at = datetime.fromtimestamp(
      story["time"]
    ).strftime("%Y-%m-%d %H:%M:%S")

    title = story["title"]

    print(f"[{score:3d}] {posted_at} {title}")