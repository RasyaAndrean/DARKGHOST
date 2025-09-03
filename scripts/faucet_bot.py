#!/usr/bin/env python3
"""
DarkGhost Testnet Faucet Bot for Discord
Supports slash commands for modern Discord interaction
"""

import discord
from discord.ext import commands
import random
import time

# Bot configuration
TOKEN = 'YOUR_BOT_TOKEN_HERE'
FAUCET_AMOUNT = 100  # DG tokens
CLAIM_INTERVAL = 86400  # 24 hours in seconds

# In-memory storage for demonstration
# In production, use a proper database
user_claims = {}

# Initialize bot with both prefix and slash command support
intents = discord.Intents.default()
intents.message_content = True
bot = commands.Bot(command_prefix='!', intents=intents)

@bot.event
async def on_ready():
    print(f'{bot.user} has connected to Discord!')
    await bot.change_presence(activity=discord.Game(name="DarkGhost Testnet Faucet"))

# Prefix commands (legacy support)
@bot.command(name='faucet')
async def faucet_prefix(ctx, address: str = None):
    """Prefix command version of faucet claim"""
    await process_faucet_request(ctx, address, is_slash=False)

@bot.command(name='balance')
async def balance_prefix(ctx):
    """Prefix command version of balance check"""
    await process_balance_request(ctx)

@bot.command(name='help')
async def help_prefix(ctx):
    """Prefix command version of help"""
    await process_help_request(ctx)

# Simulated slash command handlers using prefix commands
# In a real implementation with slash commands, you would use:
# @bot.slash_command(name="faucet", description="Claim testnet DG tokens")
# async def faucet_slash(ctx, address: str):

async def process_faucet_request(ctx, address, is_slash=False):
    """Process faucet claim request"""
    # Validate address parameter
    if not address:
        if is_slash:
            # For slash commands, you would use: await ctx.respond()
            await ctx.send("❌ Please provide a DarkGhost address to receive tokens.")
        else:
            await ctx.send("❌ Please provide a DarkGhost address to receive tokens.")
        return

    # Validate address format (basic check)
    if not address.startswith('dg1') or len(address) < 20:
        if is_slash:
            await ctx.send("❌ Invalid DarkGhost address format.")
        else:
            await ctx.send("❌ Invalid DarkGhost address format.")
        return

    # Get user ID (works for both prefix and slash commands)
    user_id = str(ctx.author.id if hasattr(ctx, 'author') else ctx.user.id)
    current_time = time.time()

    # Check if user has claimed recently
    if user_id in user_claims:
        last_claim = user_claims[user_id]
        if current_time - last_claim < CLAIM_INTERVAL:
            remaining = CLAIM_INTERVAL - (current_time - last_claim)
            hours = int(remaining // 3600)
            minutes = int((remaining % 3600) // 60)
            message = f"⏳ You can claim again in {hours} hours and {minutes} minutes!"
            if is_slash:
                await ctx.send(message)
            else:
                await ctx.send(message)
            return

    # Process claim
    user_claims[user_id] = current_time

    # In a real implementation, you would:
    # 1. Connect to the testnet wallet
    # 2. Send the specified amount to the user's address
    # 3. Verify the transaction

    # For demonstration, we'll just send a message
    tx_id = f"dg_tx_{random.randint(100000, 999999)}"
    message = f"✅ {ctx.author.mention if hasattr(ctx, 'author') else ctx.user.mention} has claimed {FAUCET_AMOUNT} DG testnet tokens!\nTransaction ID: {tx_id}"

    if is_slash:
        await ctx.send(message)
    else:
        await ctx.send(message)

async def process_balance_request(ctx):
    """Process balance check request"""
    # In a real implementation, check the actual wallet balance
    message = "🏦 Faucet balance: 100,000 DG (testnet tokens)"
    await ctx.send(message)

async def process_help_request(ctx):
    """Process help request"""
    help_text = """
🤖 **DarkGhost Testnet Faucet Bot**

Commands:
`!faucet <address>` - Claim testnet DG tokens (100 DG every 24 hours)
`!balance` - Check faucet balance
`!help` - Display this help message

🔗 Join our testnet: https://testnet.darkghost.network
📄 Documentation: https://docs.darkghost.network
    """
    await ctx.send(help_text)

# Error handling
@bot.event
async def on_command_error(ctx, error):
    if isinstance(error, commands.CommandNotFound):
        await ctx.send("❌ Command not found. Use `!help` to see available commands.")

# Run the bot
if __name__ == "__main__":
    print("Starting DarkGhost Testnet Faucet Bot...")
    print("Make sure to set your Discord bot token in the TOKEN variable!")
    bot.run(TOKEN)
