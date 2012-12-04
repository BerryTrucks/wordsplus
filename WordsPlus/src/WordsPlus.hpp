// Default empty project template
#ifndef WordsPlus_HPP_
#define WordsPlus_HPP_

#include "timer.hpp"
#include "GameSettings.hpp"
#include "soundmanager.h"
#include "ActiveFrame.h"
#include "ProfileBox.hpp"
#include "RegistrationHandler.hpp"
#include "Global.hpp"
#include "UpdateProfilePage.hpp"
#include "InviteToDownload.hpp"
#include "ScoreLoopThread.hpp"

#include <QObject>
#include <bb/cascades/Page>
#include <bb/cascades/TabbedPane>
#include <bb/cascades/Container>
#include <bb/cascades/Application>
#include <bb/cascades/ImageView>

#include <bb/platform/bbm/Context>
#include <bb/platform/bbm/UserProfile>

using namespace bb::cascades;
namespace bb { namespace cascades { class Application; class QmlDocument; class ImageView; class TouchEvent; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class WordsPlus : public QObject
{
    Q_OBJECT
public:
    WordsPlus(bb::cascades::Application *app);
    virtual ~WordsPlus();

    Q_INVOKABLE void intializePlayArea();
    Q_INVOKABLE void InitializeHomePage();
    Q_INVOKABLE void InitializePuzzlePage();

    Q_INVOKABLE void submitScore(int score);
    Q_INVOKABLE void loadLeaderboard();
    Q_INVOKABLE void loadLeaderboardAroundLastScore();
    Q_INVOKABLE void loadLeaderboardAroundUser();
    Q_INVOKABLE ScoreLoopThread* scoreLoop();

    Q_INVOKABLE void startTimer();
    Q_INVOKABLE void stopTimer();
    Q_INVOKABLE void resetTimer();
    Q_INVOKABLE void ControlsForBBM(int state);
    Q_INVOKABLE void playSound(const QString msg);

    Q_PROPERTY (const QString category READ getCategory WRITE setCategory NOTIFY categoryChanged);
    Q_PROPERTY (const QString puzzleWords READ getPuzzleWords WRITE setPuzzleWords NOTIFY puzzleWordsChanged);
    Q_PROPERTY (const QString time READ getTime NOTIFY timeChanged);
    Q_PROPERTY (const QString totalWordsFound READ getTotalWordsFound NOTIFY totalWordsFoundChanged);
    Q_PROPERTY (bool soundOn READ getSound WRITE setSound NOTIFY soundChanged);
    Q_PROPERTY (bool musicOn READ getMusic WRITE setMusic NOTIFY musicChanged);
    Q_PROPERTY (bool profileBoxOn READ getProfileBox WRITE setProfileBox NOTIFY profileBoxChanged);
    Q_PROPERTY (const QString puzzleCompletedTime READ getPuzzleCompletedTime NOTIFY puzzleCompletedTimeChanged);
    Q_PROPERTY (int score READ getScore WRITE setScore NOTIFY scoreChanged);
    Q_PROPERTY (int gamesPlayed READ getGamesPlayed NOTIFY gamesPlayedChanged);
    Q_PROPERTY (const QString selectedLetters READ getSelectedLetters WRITE setSelectedLetters NOTIFY selectedLettersChanged);
    Q_PROPERTY (int difficulty READ getDifficulty WRITE setDifficulty NOTIFY difficultyChanged);

    QString getCategory();
    void setCategory(const QString cat);

    QString getPuzzleWords();
    void setPuzzleWords(const QString words);

    QString getTime();
    QString getTotalWordsFound();

    bool getSound();
    void setSound(bool status);

    bool getMusic();
    void setMusic(bool status);

    bool getProfileBox();
    void setProfileBox(bool status);

    int getGamesPlayed();
    void setGamesPlayed();

    QString getPuzzleCompletedTime();

    int getScore();
    void setScore(int puzzleTime);

    QString getSelectedLetters();
    void setSelectedLetters(QString letter);

    int getDifficulty();
    void setDifficulty(int difficulty);

public slots:
	void scoreLoopLoaded(AppData_t *data);
	void onSubmitScoreCompleted(ScoreData_t *scoreData);

signals:
	void submitScoreCompleted();

private slots:
	void onTileTouch(bb::cascades::TouchEvent *event);
	void onTick();
	void onThumbnail();
	void onFullscreen();

signals:
	void categoryChanged(const QString);
	void puzzleWordsChanged(const QString);
	void timeChanged();
	void totalWordsFoundChanged();
	void soundChanged();
	void musicChanged();
	void profileBoxChanged();
	void puzzleCompletedTimeChanged();
	void scoreChanged();
	void gamesPlayedChanged();
	void selectedLettersChanged();
	void difficultyChanged();

private:
	void initTimer();
	void HighlightSelectedTile(int pos, int stateOfLetter);
	void WordCompleted(QList<int> listOfLetters);
	void CrossOutPuzzleWord(QString wordFound);
	void showToast(QString msg);
	void SaveBestPuzzleTime(int puzzleTime);

    Page *appPage;
    TabbedPane *tabs;
    QmlDocument *mQmlDocument;
    Control *homePageControl;
    Control *puzzlePageControl;

    // Some Controls that we need to remember
    Container *mPlayAreaContainer;
    Container *mWordsToFindContainer;
    ImageView* mPlayField[32][32]; //change this or set to 10

    // Internal game state variables
    float mWantedSize;
    float mNumTiles;
	float deltaX;
	float deltaY;
	float initX;
	float initY;
	int multiple;
	int length;
	int upperbound;
	int lowerbound;
	int position;
	int tileSize;
	int timeSec;
	int numberOfWords;
	int numberOfWordsFound;
	int numberOfGames;
	int puzzleDifficulty;
	bool isSoundEnabled;
	bool isMusicEnabled;
	bool isProfileBoxEnabled;

    QString m_strCategory;
    QString m_strPuzzleWords;
    QString m_strTime;
    QString m_strSeletedLetters;
    QList<int> tileNumbers;
    QDateTime timeKeeper;
    Timer *stopWatch;
    GameSettings *settings;
    SoundManager *mSoundManager;
    ProfileBox *profileBox;
    RegistrationHandler* regBBM;
    UpdateProfilePage *updateProfilePage;
    InviteToDownload *inviteToDownload;

    bb::platform::bbm::UserProfile * m_userProfile;

	AppData_t *mAppData;
	ScoreLoopThread *mScoreLoop;
	ScoreData_t *mLastScoreData;
};


#endif /* WordsPlus_HPP_ */
