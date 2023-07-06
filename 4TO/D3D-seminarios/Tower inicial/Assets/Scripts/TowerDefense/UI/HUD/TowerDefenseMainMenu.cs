using Core.UI;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace TowerDefense.UI.HUD
{
	/// <summary>
	/// Main menu implementation for tower defense
	/// </summary>
	public class TowerDefenseMainMenu : MainMenu
	{
		/// <summary>
		/// Reference to options menu
		/// </summary>
		public OptionsMenu optionsMenu;

		/// <summary>
		/// Reference to title menu
		/// </summary>
		public SimpleMainMenuPage titleMenu;

		/// <summary>
		/// Reference to level select menu
		/// </summary>
		public LevelSelectScreen levelSelectMenu;

		/// <summary>
		/// Bring up the options menu
		/// </summary>
		public void ShowOptionsMenu()
		{
			ChangePage(optionsMenu);
		}

		/// <summary>
		/// Returns to the title screen
		/// </summary>
		public void ShowTitleScreen()
		{
			Debug.Log("You have clicked the button Options	!");
			Back(titleMenu);
		}


		public void Quit()
		{
			Application.Quit();
		}
		public void LoadScene()
		{
			SceneManager.LoadScene("Level1");
		}

		/// <summary>
		/// Set initial page
		/// </summary>
		protected virtual void Awake()
		{
			ShowTitleScreen();
		}
	}
}