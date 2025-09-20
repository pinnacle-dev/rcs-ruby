#!/usr/bin/env python3
"""
Pinnacle SDK Structure Updater and Release Tool

This script automatically updates the SDK client structures and handles versioning/tagging.

Usage:
    python3 update_and_release.py              # Interactive mode
    python3 update_and_release.py 2.0.0-rc.5   # Specify version directly
    python3 update_and_release.py --no-tag     # Update without tagging
"""

import sys
import re
import subprocess
from pathlib import Path
from typing import List, Optional

class SDKUpdater:
    def __init__(self):
        self.changes_made: List[str] = []
        self.base_path = Path.cwd()

    def run(self, version: Optional[str] = None, no_tag: bool = False) -> None:
        """Main entry point for the updater."""
        print("🔧 Pinnacle SDK Structure Updater")
        print("=================================")

        # Update the SDK structure
        self.update_messages_client()
        self.update_phone_numbers_client()

        # Show summary
        if self.changes_made:
            print("\n✅ Successfully updated:")
            for change in self.changes_made:
                print(f"   - {change}")
        else:
            print("\n✅ All client structures are already up to date!")

        # Always handle versioning and tagging unless --no-tag is specified
        if not no_tag:
            self.handle_versioning_and_tagging(version)

    def update_messages_client(self) -> None:
        """Update the Messages client with sms, mms, rcs accessors."""
        file_path = self.base_path / "lib" / "rcs" / "messages" / "client.rb"

        if not file_path.exists():
            print(f"⚠️  {file_path} not found")
            return

        content = file_path.read_text()
        original_content = content

        # Check if already updated
        if "attr_reader :sms" in content:
            return

        # Add requires at the top
        if 'require_relative "sms/client"' not in content:
            content = re.sub(
                r'require_relative "../types/reaction_result"\nrequire "async"',
                '''require_relative "../types/reaction_result"
require_relative "sms/client"
require_relative "mms/client"
require_relative "rcs/client"
require "async"''',
                content
            )

        # Update MessagesClient
        messages_client_pattern = r'''(module Pinnacle
  class MessagesClient
    # @return \[Pinnacle::RequestClient\]
    attr_reader :request_client

    # @param request_client \[Pinnacle::RequestClient\]
    # @return \[Pinnacle::MessagesClient\]
    def initialize\(request_client:\)
      @request_client = request_client)
    end'''

        messages_client_replacement = r'''module Pinnacle
  class MessagesClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client
    # @return [Pinnacle::Messages::SmsClient]
    attr_reader :sms
    # @return [Pinnacle::Messages::MmsClient]
    attr_reader :mms
    # @return [Pinnacle::Messages::RcsClient]
    attr_reader :rcs

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::MessagesClient]
    def initialize(request_client:)
      @request_client = request_client
      @sms = Pinnacle::Messages::SmsClient.new(request_client: request_client)
      @mms = Pinnacle::Messages::MmsClient.new(request_client: request_client)
      @rcs = Pinnacle::Messages::RcsClient.new(request_client: request_client)
    end'''

        content = re.sub(messages_client_pattern, messages_client_replacement, content)

        # Update AsyncMessagesClient
        async_client_pattern = r'''(  class AsyncMessagesClient
    # @return \[Pinnacle::AsyncRequestClient\]
    attr_reader :request_client

    # @param request_client \[Pinnacle::AsyncRequestClient\]
    # @return \[Pinnacle::AsyncMessagesClient\]
    def initialize\(request_client:\)
      @request_client = request_client)
    end'''

        async_client_replacement = r'''  class AsyncMessagesClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client
    # @return [Pinnacle::Messages::AsyncSmsClient]
    attr_reader :sms
    # @return [Pinnacle::Messages::AsyncMmsClient]
    attr_reader :mms
    # @return [Pinnacle::Messages::AsyncRcsClient]
    attr_reader :rcs

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncMessagesClient]
    def initialize(request_client:)
      @request_client = request_client
      @sms = Pinnacle::Messages::AsyncSmsClient.new(request_client: request_client)
      @mms = Pinnacle::Messages::AsyncMmsClient.new(request_client: request_client)
      @rcs = Pinnacle::Messages::AsyncRcsClient.new(request_client: request_client)
    end'''

        content = re.sub(async_client_pattern, async_client_replacement, content)

        if content != original_content:
            file_path.write_text(content)
            print(f"✅ Updated {file_path}")
            self.changes_made.append("MessagesClient (added sms, mms, rcs accessors)")
            self.changes_made.append("AsyncMessagesClient (added sms, mms, rcs accessors)")

    def update_phone_numbers_client(self) -> None:
        """Update the PhoneNumbers client with campaign and webhook accessors."""
        file_path = self.base_path / "lib" / "rcs" / "phone_numbers" / "client.rb"

        if not file_path.exists():
            print(f"⚠️  {file_path} not found")
            return

        content = file_path.read_text()
        original_content = content

        # Check if already updated
        if "attr_reader :campaign" in content:
            return

        # Add requires at the top
        if 'require_relative "campaign/client"' not in content:
            content = re.sub(
                r'require_relative "types/phone_numbers_get_response"\nrequire "async"',
                '''require_relative "types/phone_numbers_get_response"
require_relative "campaign/client"
require_relative "webhook/client"
require "async"''',
                content
            )

        # Update PhoneNumbersClient
        phone_client_pattern = r'''(module Pinnacle
  class PhoneNumbersClient
    # @return \[Pinnacle::RequestClient\]
    attr_reader :request_client

    # @param request_client \[Pinnacle::RequestClient\]
    # @return \[Pinnacle::PhoneNumbersClient\]
    def initialize\(request_client:\)
      @request_client = request_client)
    end'''

        phone_client_replacement = r'''module Pinnacle
  class PhoneNumbersClient
    # @return [Pinnacle::RequestClient]
    attr_reader :request_client
    # @return [Pinnacle::PhoneNumbers::CampaignClient]
    attr_reader :campaign
    # @return [Pinnacle::PhoneNumbers::WebhookClient]
    attr_reader :webhook

    # @param request_client [Pinnacle::RequestClient]
    # @return [Pinnacle::PhoneNumbersClient]
    def initialize(request_client:)
      @request_client = request_client
      @campaign = Pinnacle::PhoneNumbers::CampaignClient.new(request_client: request_client)
      @webhook = Pinnacle::PhoneNumbers::WebhookClient.new(request_client: request_client)
    end'''

        content = re.sub(phone_client_pattern, phone_client_replacement, content)

        # Update AsyncPhoneNumbersClient
        async_phone_pattern = r'''(  class AsyncPhoneNumbersClient
    # @return \[Pinnacle::AsyncRequestClient\]
    attr_reader :request_client

    # @param request_client \[Pinnacle::AsyncRequestClient\]
    # @return \[Pinnacle::AsyncPhoneNumbersClient\]
    def initialize\(request_client:\)
      @request_client = request_client)
    end'''

        async_phone_replacement = r'''  class AsyncPhoneNumbersClient
    # @return [Pinnacle::AsyncRequestClient]
    attr_reader :request_client
    # @return [Pinnacle::PhoneNumbers::AsyncCampaignClient]
    attr_reader :campaign
    # @return [Pinnacle::PhoneNumbers::AsyncWebhookClient]
    attr_reader :webhook

    # @param request_client [Pinnacle::AsyncRequestClient]
    # @return [Pinnacle::AsyncPhoneNumbersClient]
    def initialize(request_client:)
      @request_client = request_client
      @campaign = Pinnacle::PhoneNumbers::AsyncCampaignClient.new(request_client: request_client)
      @webhook = Pinnacle::PhoneNumbers::AsyncWebhookClient.new(request_client: request_client)
    end'''

        content = re.sub(async_phone_pattern, async_phone_replacement, content)

        if content != original_content:
            file_path.write_text(content)
            print(f"✅ Updated {file_path}")
            self.changes_made.append("PhoneNumbersClient (added campaign, webhook accessors)")
            self.changes_made.append("AsyncPhoneNumbersClient (added campaign, webhook accessors)")

    def handle_versioning_and_tagging(self, version: Optional[str] = None) -> None:
        """Handle version updates and git tagging."""
        print("\n📦 Version Management")
        print("--------------------")

        # Get current version from gemspec
        gemspec_path = self.base_path / "rcs.gemspec"
        current_version = None

        if gemspec_path.exists():
            content = gemspec_path.read_text()
            match = re.search(r'spec\.version = ["\'](.+)["\']', content)
            if match:
                current_version = match.group(1)
                print(f"Current version: {current_version}")

        # Get version input if not provided
        if version is None:
            response = input("\nDo you want to update the version and create a tag? (y/n): ")
            if response.lower() != 'y':
                return

            version = input("Enter the new version (e.g., 2.0.0-rc.5): ")

        if not version:
            print("❌ No version provided, skipping versioning")
            return

        # Update version in gemspec
        if gemspec_path.exists():
            content = gemspec_path.read_text()
            content = re.sub(
                r'spec\.version = ["\'].+["\']',
                f'spec.version = "{version}"',
                content
            )
            gemspec_path.write_text(content)
            print(f"✅ Updated version in rcs.gemspec to {version}")

        # Update version in lib/requests.rb
        requests_path = self.base_path / "lib" / "requests.rb"
        if requests_path.exists():
            content = requests_path.read_text()
            # Update X-Fern-SDK-Version headers (Ruby uses : not =>)
            updated = re.sub(
                r'"X-Fern-SDK-Version":\s*"[\d\.\-\w]+"',
                f'"X-Fern-SDK-Version": "{version}"',
                content
            )
            if updated != content:
                requests_path.write_text(updated)
                print(f"✅ Updated version in lib/requests.rb to {version}")

        # Show git commands
        print("\n🚀 Git Commands")
        print("---------------")

        commit_message = f"""Release {version}

- Update Messages client structure (sms, mms, rcs accessors)
- Update PhoneNumbers client structure (campaign, webhook accessors)
- Fix client method chaining for all modules
- Update version to {version}"""

        print("\nCommands to run:")
        print(f"  git add -A")
        print(f'  git commit -m "{commit_message}"')
        print(f'  git tag -a {version} -m "Release {version}"')
        print(f"  git push origin main")
        print(f"  git push origin {version}")

        # Ask if we should run the commands
        response = input("\nDo you want to run these commands automatically? (y/n): ")
        if response.lower() == 'y':
            self.run_git_commands(version, commit_message)

    def run_git_commands(self, version: str, commit_message: str) -> None:
        """Execute git commands for release."""
        try:
            # Stage all changes
            subprocess.run(["git", "add", "-A"], check=True)
            print("✅ Staged all changes")

            # Commit
            subprocess.run(["git", "commit", "-m", commit_message], check=True)
            print("✅ Committed changes")

            # Create tag
            subprocess.run(["git", "tag", "-a", version, "-m", f"Release {version}"], check=True)
            print(f"✅ Created tag {version}")

            # Ask before pushing
            response = input("\nDo you want to push to origin? (y/n): ")
            if response.lower() == 'y':
                subprocess.run(["git", "push", "origin", "main"], check=True)
                subprocess.run(["git", "push", "origin", version], check=True)
                print(f"✅ Pushed to origin")
                print(f"\n🎉 Release {version} complete!")
            else:
                print("\n📌 To push manually, run:")
                print(f"  git push origin main")
                print(f"  git push origin {version}")

        except subprocess.CalledProcessError as e:
            print(f"❌ Git command failed: {e}")
            sys.exit(1)


def main():
    """Main entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="Update Pinnacle SDK structure and create release")
    parser.add_argument("version", nargs="?", help="Version for the release (e.g., 2.0.0-rc.5)")
    parser.add_argument("--no-tag", action="store_true", help="Update without creating a git tag")

    args = parser.parse_args()

    updater = SDKUpdater()
    updater.run(version=args.version, no_tag=args.no_tag)


if __name__ == "__main__":
    main()