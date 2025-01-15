#!/usr/bin/env node

import * as https from 'https';
import * as process from 'process';
import '../libs/dotenv.mjs';

// To generate an API key/token, head to https://trello.com/app-key
// https://trello.com/power-ups/admin/
const TRELLO_KEY = process.env.TRELLO_KEY
const TRELLO_SECRET = process.env.TRELLO_SECRET
const TRELLO_TOKEN = process.env.TRELLO_TOKEN
// To find the Board ID, head to https://api.trello.com/1/members/me/boards?key={TRELLO_KEY}&token={TRELLO_TOKEN}
// To find the List ID, head to https://api.trello.com/1/boards/{BOARD_ID}/lists?key={TRELLO_KEY}&token={TRELLO_TOKEN}

const TRELLO_LIST_ID = process.env.TRELLO_LIST_ID

// To find the List ID, head to https://api.trello.com/1/me?key={TRELLO_KEY}&token={TRELLO_TOKEN}
const TRELLO_MEMBER_ID = process.env.TRELLO_MEMBER_ID

if (!TRELLO_KEY) {
    console.error('💥 Command not configured correctly. Missing variable: TRELLO_KEY');
    process.exit(1);
}

if (!TRELLO_TOKEN) {
    console.error('💥 Command not configured correctly. Missing variable: TRELLO_TOKEN');
    process.exit(1);
}

if (!TRELLO_LIST_ID) {
    console.error('💥 Command not configured correctly. Missing variable: TRELLO_LIST_ID');
    process.exit(1);
}

if (!TRELLO_MEMBER_ID) {
    console.error('💥 Command not configured correctly. Missing variable: TRELLO_MEMBER_ID');
    process.exit(1);
}

// https://nodejs.org/docs/latest/api/process.html#processargv
const name = process.argv[2];
const dueDate = process.argv[3];

if (!name) {
    console.error('💥 Please provide a card title');
    process.exit(1);
}

const payload = {
    key: TRELLO_KEY,
    token: TRELLO_TOKEN,
    idList: TRELLO_LIST_ID,
    idMembers: [TRELLO_MEMBER_ID],
    name: name,
    pos: 'top'
};

if (dueDate) {
    try {
        const datetime = new Date(dueDate);
        if (!(datetime instanceof Date)) {
            throw new Error('Invalid date');
        }
        payload['due'] = datetime.toISOString().split('T')[0];
    } catch (error) {
        console.error('💥 Error parsing due date:', error);
    }
}

const postData = new URLSearchParams(payload).toString();

const options = {
    hostname: 'api.trello.com',
    path: '/1/cards',
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': postData.length
    }
};

const req = https.request(options, res => {
    let data = '';

    res.on('data', chunk => {
        data += chunk;
    });

    res.on('end', () => {
        if (res.statusCode && res.statusCode >= 200 && res.statusCode < 300) {
            console.log('✅ Trello card created successfully');
        } else {
            console.error('💥 Error creating Trello card:', res.statusCode, data);
            process.exit(1);
        }
    });
});

req.on('error', error => {
    console.error('💥 Error creating Trello card:', error);
    process.exit(1);
});

req.write(postData);
req.end();
