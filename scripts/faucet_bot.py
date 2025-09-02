#!/usr/bin/env python3
"""
DarkGhost Testnet Faucet Bot for Discord
"""

import discord
import random
import time
from discord.ext import commands

# Bot configuration
TOKEN = 'YOUR_BOT_TOKEN_HERE'
FAUCET_AMOUNT = 100  # DG tokens
CLAIM_INTERVAL = 86400  # 24 hours in seconds

# In-memory storage for demonstration
# In production, use a proper database
user_claims = {}

# Initialize bot
intents = discord.Intents.default()
intents.message_content = True
bot = commands.Bot(command_prefix='!', intents=intents)

@bot.event
async def on_ready():
    print(f'{bot.user} has connected to Discord!')
    await bot.change_presence(activity=discord.Game(name="DarkGhost Testnet Faucet"))

@bot.command(name='faucet')
async def faucet(ctx):
    """Claim testnet DG tokens"""
    user_id = str(ctx.author.id)
    current_time = time.time()
    
    # Check if user has claimed recently
    if user_id in user_claims:
        last_claim = user_claims[user_id]
        if current_time - last_claim < CLAIM_INTERVAL:
            remaining = CLAIM_INTERVAL - (current_time - last_claim)
            hours = int(remaining // 3600)
            minutes = int((remaining % 3600) // 60)
            await ctx.send(f"⏳ You can claim again in {hours} hours and {minutes} minutes!")
            return
    
    # Process claim
    user_claims[user_id] = current_time
    
    # In a real implementation, you would:
    # 1. Connect to the testnet wallet
    # 2. Send the specified amount to the user's address
    # 3. Verify the transaction
    
    # For demonstration, we'll just send a message
    await ctx.send(f"✅ {ctx.author.mention} has claimed {FAUCET_AMOUNT} DG testnet tokens! "
                   f"Transaction ID: dg_tx_{random.randint(100000, 999999)}")

@bot.command(name='balance')
async def balance(ctx):
    """Check faucet balance"""
    # In a real implementation, check the actual wallet balance
    await ctx.send("🏦 Faucet balance: 100,000 DG (testnet tokens)")

@bot.command(name='help')
async def help_command(ctx):
    """Display help information"""
    help_text = """
🤖 **DarkGhost Testnet Faucet Bot**

Commands:
`!faucet` - Claim testnet DG tokens (100 DG every 24 hours)
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