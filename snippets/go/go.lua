local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

local snippets = {};

-- for iterating over async collections
table.insert(snippets, ls.s('http_request', {
            t("type data struct {"),
            t("		Id   string `json:\"id\"`"),
            t("		name string `json:\"name\"`"),
            t("		age  int    `json:\"age\"`"),
            t("	}"),
            t(""),
            t("	payload := []data{"),
            t("		{"),
            t("			Id:   \"1\","),
            t("			name: \"John\","),
            t("			age:  25,"),
            t("		},"),
            t("	}"),
            t(""),
            t("	marshal, err := json.Marshal(payload)"),
            t("	if err != nil {"),
            t("		fmt.Println(err)"),
            t("	}"),
            t(""),
            t("	req, err := http.NewRequest(\"POST\", \"http://localhost:8080\", bytes.NewBuffer(marshal))"),
            t("	req.Header.Set(\"Content-Type\", \"application/json\")"),
            t("	req.Header.Set(\"Authorization\", \"Bearer token\")"),
            t(""),
            t("	client := http.Client{Timeout: time.Second * 10}"),
            t("	resp, err := client.Do(req)"),
            t("	if err != nil {"),
            t("		fmt.Println(err)"),
            t("	}"),
            t(""),
            t("	defer resp.Body.Close()"),
            t(""),
            t("	resBody, err := io.ReadAll(resp.Body)"),
            t("	if err != nil {"),
            t("		fmt.Println(err)"),
            t("	}"),
            t("	fmt.Println(string(resBody))"),
}))

ls.add_snippets("go", snippets);
