#!/usr/bin/env -S uv run --script
# /// script
# dependencies = [
#     "plyer",
#     "requests",
#     "click"
# ]
# ///

import json
import sys
import click
import requests
from plyer import notification


@click.command()
@click.option('--ntfy-topic', help='ntfy.sh topic to send notifications to')
def main(ntfy_topic):
    """Claude Code notification hook that sends desktop and optionally ntfy.sh notifications."""
    try:
        # Read JSON input from stdin
        input_data = sys.stdin.read()
        data = json.loads(input_data)
        
        # Extract notification details
        title = data.get('title', 'Claude Code')
        message = data.get('message', '')
        
        # Send desktop notification
        try:
            notification.notify(
                title=title,
                message=message,
                app_name='Claude Code',
                timeout=10
            )
        except Exception as e:
            print(f"Failed to send desktop notification: {e}", file=sys.stderr)
            # Continue even if desktop notification fails
        
        # Send ntfy.sh notification if topic is provided
        if ntfy_topic:
            try:
                response = requests.post(
                    f'https://ntfy.sh/{ntfy_topic}',
                    data=message.encode('utf-8'),
                    headers={
                        'Title': title,
                        'Priority': 'default'
                    }
                )
                response.raise_for_status()
            except Exception as e:
                print(f"Failed to send ntfy.sh notification: {e}", file=sys.stderr)
                return 2
        
        return 0
        
    except json.JSONDecodeError as e:
        print(f"Failed to parse JSON input: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        return 2


if __name__ == '__main__':
    sys.exit(main())